import heapq
class Interval:
    def __init__(self, start, end):
        self.start = start
        self.end = end

    def __lt__(self, other):
        if self.end == other.end:
            return self.start < other.start
        return self.end < other.end

def min_color(schedules):
    
    pass