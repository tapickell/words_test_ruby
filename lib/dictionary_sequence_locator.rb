class DictionarySequenceLocator

  # Dictionary, SequenceFile and Words file could possibly be seperate
  # classes that inherit from a File super class.

  def self.process_file(file_name)
    @dictionary_file = DictionaryFile.new(file_name)
    self.create_output_files
  end

  private

  def self.create_output_files
    sequences = File.open("sequences.txt",  "w") do |file|
      file.write("sequences/n")
    end

    words = File.open("words.txt",  "w") do |file|
      file.write("words/n")
    end
  end

  class DictionaryFile
    include Enumerable

    def initialize(file_name)
      @dictionary = []
      load_from_file file_name
    end

    def each(&block)
      @dictionary.each do |word|
        if block_given?
          block.call word
        else
          yield word
        end
      end
    end

    private

    def load_from_file
      File.open(file_name, "r").each do |line|
        @dictionary << line
      end
    end

  end

end
