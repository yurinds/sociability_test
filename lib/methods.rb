def read_file(path)
  file = File.new(path, 'r:UTF-8')
  file_text_array = file.readlines
  file_text_array.map!(&:strip)
  file.close

  file_text_array
end
