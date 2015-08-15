interrupted = false
trap('QUIT') { interrupted = true }
trap('INT') { interrupted = true }
trap('ABRT') { interrupted = true }

File.open('big', 'w') do |f|
  f.write("\x00") until interrupted
end rescue nil
