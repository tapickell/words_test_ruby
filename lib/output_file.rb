class OutputFile
  def initialize(file_name)
    @file = File.open(file_name, "w") do |file|
      file.write(file_name.gsub(".txt", ""))
    end
  end

  def add(input)
    @file.write input
  end
end
