class BSearch
  def chop(target, sorted_array)
    # Returns the index of the target if it exists in the list, 
    # otherwise returns -1.
    first, last = 0, sorted_array.length - 1
    while first <= last
      mid = (first + last) / 2
      if target == sorted_array[mid]
        target
      elsif target > sorted_array[mid]
        first = mid + 1
      else  # key < sorted_array[mid]
        last = mid - 1
      end
    end
    # Target not found.
    -1
  end
end
