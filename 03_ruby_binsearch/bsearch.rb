class BSearch
  # Implements a binary search algorithm.
  def chop(target, sorted_array)
    # Returns the index of the target if it exists in the list, 
    # otherwise returns -1.
    first, last = 0, sorted_array.length - 1
    while first <= last
      mid = (first + last) / 2
      if target == sorted_array[mid]
        return mid
      elsif target > sorted_array[mid]
        # Cut in half and search the top half
        first = mid + 1
      else  # key < sorted_array[mid]
        # Cut in half and search the bottom half
        last = mid - 1
      end
    end
    # Target not found.
    -1
  end
end
