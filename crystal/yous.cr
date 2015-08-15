interrupted = false
Signal::QUIT.trap { interrupted = true }
Signal::INT.trap { interrupted = true }
Signal::ABRT.trap { interrupted = true }

File.open("big", "w") do |f|
  until interrupted
    f.print("\u{0}")
  end
end rescue nil
