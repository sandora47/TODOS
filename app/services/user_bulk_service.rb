class UserBulkService < ApplicationService
  def initialize(archive_param)
    @archive = archive_param.tempfile
  end

  def call
    if archive.path.end_with?('.zip')
      Zip::File.open(archive) do |zip_file|
        zip_file.each do |entry|
          User.import archive_parser(entry), ignore: true
        end
      end
    else
      User.import xlsx_parser(archive), ignore: true
    end
  end

  private

  attr_reader :archive

  def archive_parser(entry)
    sheet = RubyXL::Parser.parse_buffer(entry.get_input_stream.read)[0]
    users_entity(sheet)
  end

  def xlsx_parser(entry)
    sheet = RubyXL::Parser.parse(entry)[0]
    users_entity(sheet)
  end

  def users_entity(sheet)
    sheet.map do |row|
      cells = row.cells.map { |c| c&.value.to_s }
      User.new name: cells[0],
               email: cells[1],
               password: cells[2],
               password_confirmation: cells[2]
    end
  end
end
