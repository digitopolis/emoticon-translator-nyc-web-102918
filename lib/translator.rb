# require modules here
require "yaml"

#{
# angel: ["english", "japanese"],
# angry: ["english", "japanese"],
# ..
# }

def load_library(file_path)
  library = YAML.load_file(file_path)
  emoji_library = { "get_meaning" => {}, "get_emoticon" => {} }
  library.each do |meaning, emoji|
    emoji_library["get_meaning"][emoji[1]] = meaning
    emoji_library["get_emoticon"][emoji[0]] = emoji[1]
  end
  emoji_library
end

def get_japanese_emoticon(file_path, emoticon)
  emoji_library = load_library(file_path)
  if emoji_library["get_emoticon"].keys.include?(emoticon)
    japanese_emoticon = emoji_library["get_emoticon"][emoticon]
    japanese_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoji_library = load_library(file_path)
  if emoji_library["get_meaning"].keys.include?(emoticon)
    english_meaning = emoji_library["get_meaning"][emoticon]
    english_meaning
  else
    "Sorry, that emoticon was not found"
  end
end
