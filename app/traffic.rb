#!/usr/bin/env ruby

NORTH = 0
SOUTH = 1
EAST = 2
WEST = 3
dirs = %w[North South East West]
# 每个方向出现车辆的或然率：
p = Array.new(4)
p[NORTH] = 1.0 / 3.0
p[SOUTH] = 1.0 / 5.0
p[EAST] = 1.0 / 4.0
p[WEST] = 1.0 / 6.0
# 队列：队列以数组中的元素形式存储。
waiting = Array.new(4)
waiting[NORTH] = Queue.new
waiting[SOUTH] = Queue.new
waiting[EAST] = Queue.new
waiting[WEST] = Queue.new
lengths = [0, 0, 0, 0]
# 变成绿灯时队列多长？
greens = [0, 0, 0, 0]
# 要多长时间变成绿灯？
times = [0, 0, 0, 0]
# 车辆等待多少时间？
ncars = [0, 0, 0, 0]
# 多少车辆通过信号灯？
maxtime = [0, 0, 0, 0]
# 最长的等待时间？
# 循环...
time = 0
while time < 8900 * 10
  change = true
  # 信号灯改变
  for time in time..time + 40
    # 北/南绿灯40秒。
    # 以随机方式，将所有到达车辆入队。
    for dir in NORTH..WEST
      waiting[dir] << time if rand < p[dir]
    end
    # 记录队列的长度，元素数量
    if change
      for dir in NORTH..SOUTH
        lengths[dir] += waiting[dir].length
        greens[dir] += 1
      end
      change = false
    end
    # N/S can leave, one per second...
    for dir in NORTH..SOUTH
      next if waiting[dir].empty?
      car = waiting[dir].shift
      wait = time - car
      ncars[dir] += 1
      times[dir] += wait
      maxtime[dir] = [maxtime[dir], wait].max
    end
  end
  for time in time..time + 2
    # Yellow/red
    # Nothing happens...
  end
  change = true
  # Light changed
  for time in time..time + 45
    # East/west green
    # Enqueue all arrivals
    for dir in NORTH..WEST
      waiting[dir] << time if rand < p[dir]
    end
    # Record queue lengths, counts
    if change
      for dir in EAST..WEST
        lengths[dir] += waiting[dir].length
        greens[dir] += 1
      end
      change = false
    end
    # N/S can leave, one per second...
    for dir in EAST..WEST
      next if waiting[dir].empty?
      car = waiting[dir].shift
      wait = time - car
      ncars[dir] += 1
      times[dir] += wait
      maxtime[dir] = [maxtime[dir], wait].max
    end
  end
  for time in time..time + 2
    # Yellow/red
    # Nothing happens...
  end
end
# Display results...
puts "Average queue lengths:"
for dir in NORTH..WEST
  printf "%-5s %6.1f\n", dirs[dir], lengths[dir] / greens[dir].to_f
end
puts "Max wait times:"
for dir in NORTH..WEST
  printf "%-5s %4d\n", dirs[dir], maxtime[dir]
end
puts "Average wait times:"
for dir in NORTH..WEST
  printf "%-5s %6.1f\n", dirs[dir], times[dir] / ncars[dir].to_f
end
