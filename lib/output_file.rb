class OutputFile
  def initialize(file_name)
    @file = File.open(file_name, "w")
    @file.write("'#{file_name.gsub(".txt", "")}'\n\n")
  end

  def add(input)
    @file.write input + "\n"
  end
end
