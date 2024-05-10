-- Sleep script
-- This is a 'busy' sleep because the cpu runs throughout the duration.
-- `os.execute("sleep <seconds>")` is not portable and `socket.sleep(duration)` from LuaSocket is not available.
clock = os.clock
sleep_duration = arg
sleep_start = clock()
sleep_end = sleep_start + sleep_duration

repeat until clock() > sleep_end

return sleep_duration