module Drawer

  def silence_output!
    @show_output = false
  end

  private

  def draw(text, only_if_at_base = false)
    current_level = level
    return if only_if_at_base and current_level > 0

    current_level.times { print "  " }
    puts text
  end

  def level
    call_counts = -1
    caller.each do |call_line|
      call_counts += 1 if call_line =~ /`dynamic_solution/ || call_line =~ /`block in dynamic_solution/
    end
    call_counts
  end
end