# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  
  ALPHA = [*?a..?z]
	
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    # IMPLEMENT THIS METHOD
    result = 0
    str.split('').each do |letter|
      idx = ALPHA.find_index(letter) + 1
      if result == 0
	result = idx
      else
        result = result << 5 
	result |= idx 	
      end
    end
    result
  end

  def self.unpack_recursion(packed)
    return "" if packed.zero?

    idx = packed & 31
    unpack_recursion(packed >> 5) + ALPHA[idx-1]
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    # IMPLEMENT THIS METHOD  
    unpack_recursion(packed)
  end
end
