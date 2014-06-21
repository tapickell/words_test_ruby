class OutputFile
  def initialize(file_name)
    @file = File.open(file_name, "w")
    @file.write(title(file_name))
  end

  def add(input)
    @file.write input + "\n"
  end

  private

  def title(file_name)
    "'#{file_name.gsub("test_", "").gsub("real_", "").gsub(".txt", "")}'\n\n"
  end
end
