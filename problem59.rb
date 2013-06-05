

# Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
# 
# A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
# 
# For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.
# 
# Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
# 
# Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher1.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.



ciphertext = File.open("cipher1.txt").read.split(",")
#ciphertext = [79,59,12,2,79,35,8,28,20]

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]


possible_password = []
sum = 0

# go through each 3-letter password
count = 0
alphabet.permutation(3).each do |password|
  count += 1
  plaintext = []
  
  index = 0
  ciphertext.each do |cipher_letter|
    pc = password[index].ord
    
    letter = pc ^ cipher_letter.to_i
    
    plaintext << letter.chr
    
    index += 1
    index %= 3
  end
  
  text = plaintext.join("")
  
  
  if text =~ / the /i
    possible_password = password
    sum = plaintext.inject(0) { |total, i| total + i.ord }
    puts "With password '#{password.join("")}': #{sum}"
  end
end

