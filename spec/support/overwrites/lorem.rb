module Faker
  # Based on Perl's Text::Lorem
  class Lorem
    def self.sentences(sentence_count = 3)
      [].tap do |sentences|
        1.upto(sentence_count) do
          sentences << sentence
        end
      end
    end

    def self.paragraphs(paragraph_count = 3)
      [].tap do |paragraphs|
        1.upto(paragraph_count) do
          paragraphs << paragraph
        end
      end
    end
  end
end