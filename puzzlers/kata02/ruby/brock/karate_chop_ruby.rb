#!/usr/bin/ruby


# -----  Requirements  -----


# -----  Class Defs  -----

class KarateChop
    
    def initialize()
    end
    
    # -----  Class Methods  -----    
    
    # ==============================
    # CHOP methods
    # ==============================
    def self.chop(i, numARR, type = nil, log = false)
        case type
        when "sorted-while-loop"
            self.chop_sorted_by_while_loop(i, numARR, log)
        when "sorted-recursion"
            self.chop_sorted_by_recursion(i, numARR, log)
        when "sorted-iteration"
            self.chop_sorted_by_iteration_loop(i, numARR, log)
        when "unsorted-recursion-2"
            self.chop_unsorted_by_recursion2(i, numARR, log)
        else
            self.chop_recursion(i, numARR, log)
        end
    end
    # ------------------------------
    
    
    # - 1st attempt
    def self.chop_recursion(i, numARR, log = false, emergencyStop = nil)
        puts "[chop_recursion]> i = #{i};  numARR = #{numARR}" if log
        raise unless i.is_a?(Integer)
        raise unless numARR.is_a?(Array)
        emergencyStop = numARR.length if ! emergencyStop
        # - FINAL STATE
        if numARR.length <= 1 || emergencyStop < 0
            return 0 if numARR.first && numARR.first.eql?(i)
            return -1
        end
        # - Set index to return
        start = 0
        stop = (numARR.length - 1)
        midHigh = numARR.length/2
        midLow = midHigh - 1
        puts "[chop_recursion]> start = #{start}; stop = #{stop}; midLow = #{midLow}; midHigh = #{midHigh}" if log
        # - DIVIDE and RECURSE
        firstHalf = self.chop_recursion(i, numARR[start..midLow], log, (emergencyStop-1) )
        case 
            when firstHalf < 0
                secondHalf = self.chop_recursion(i, numARR[midHigh..stop], log, (emergencyStop-1) )
                case 
                    when secondHalf < 0
                        return secondHalf
                    else 
                        return midHigh + secondHalf
                end
            else
                return firstHalf
        end
    end
    # ------------------------------
    
    
    # - 3rd attempt
    #   - Array is sorted
    #   - Use no index ref, except for taking sub-sets
    def self.chop_sorted_by_recursion(i, numARR, emergency_break = nil, log = false)
        puts "[chop_sorted_by_recursion]> i = #{i};  numARR = #{numARR}" if log
        raise unless i.is_a?(Integer)
        raise unless numARR.is_a?(Array)
        # - Set and update an emergency break (no infinite looping)
        puts "\temergency_break: #{emergency_break}"
        if ! emergency_break
            emergency_break = numARR.length
        elsif emergency_break < 0
            # - We have run too long, end!
            raise "[chop_sorted_by_recursion:90]>  INFINITE LOOP detected.  Current sub-set: #{numARR}; emergency_break: #{emergency_break}"
        else
            emergency_break -= 1
        end
        # - Define index values to use.
        idx = { :mid => ((numARR.length/2)-1) }
        # - Divide the array.
        loARR = numARR[0..idx[:mid]]
        hiARR = numARR[(idx[:mid]+1)..(numARR.length-1)]
        # --- FINAL STATE(s) ---
        case
        when numARR.empty?
            # - We somehow recursed on an empty sub-set; "i" was not there.
            return -1
        when numARR.length.eql?(1)
            # - We have only 1 item left; return 0 if it's our item or -1 if not.
            return 0 if numARR.first.eql?(i)
            return -1
        else
            # - Do nothing.
        end
        # --- RECURSE ---
        if i <= loARR.last
            # - Recurse on the lower half.
            return self.chop_sorted_by_recursion(i, loARR, emergency_break, log)
        else
            # - Recurse on the upper half.
            hiRES = self.chop_sorted_by_recursion(i, hiARR, emergency_break, log)
            # - We have to add 1 higher-than our mid-point value to this, to get the correct index.
            return hiRES if hiRES.eql?(-1)
            return (idx[:mid]+1) + hiRES 
        end
    end
    # ------------------------------
    
    
    # - 2nd attempt
    def self.chop_sorted_by_while_loop(i, numARR, log = false)
        puts "[chop_sorted_while_loop]> i = #{i};  numARR = #{numARR}" if log
        raise unless i.is_a?(Integer)
        raise unless numARR.is_a?(Array)
        # - Loop while we still have elements to find.
        newARR = Array.new(numARR)
        emergency_break = newARR.length
        idx = {
            :ret => -1,
            :low => 0,
            :high => newARR.length - 1
            }
        while ! newARR.empty?() && idx[:ret].eql?(-1) && emergency_break >= 0
            puts "[chop_sorted_while_loop:71]> newARR: #{newARR};  idxLow: #{idx[:low]};  idxHigh: #{idx[:high]};  return: #{idx[:ret]}" if log
            # - Have we reduced to 1 element
            if newARR.length.eql?(1)
                # - YES: Set the index to return if the value matches i;  then break.
                idx[:ret] = idx[:low] if newARR.first.eql?(i)
                break
            else
                # - NO: Find the mid-point of the array;
                midIdx = newARR.length / 2
                puts "[chop_sorted_while_loop]> idxMid: #{midIdx};  element: #{newARR[midIdx]}" if log
                case
                when newARR[midIdx].eql?(i)
                    # - We found the element.
                    idx[:ret] = idx[:low] + midIdx
                    break
                when newARR[midIdx] > i
                    # - Reset index values for the sub-array BELOW the midpoint.
                    idx[:high] = (idx[:low] + midIdx) - 1
                else
                    # - Reset index values for the sub-array ABOVE the midpoint.
                    idx[:low] = (idx[:low] + midIdx) + 1
                end
                puts "[chop_sorted_while_loop:93]> newARR: #{newARR};  idxLow: #{idx[:low]};  idxHigh: #{idx[:high]};  return: #{idx[:ret]}" if log
                # - Break, if the indexes for the sub-array are invalid (empty or low>high)
                break if idx[:low] > idx[:high]
                # - Reset the array as a smaller sub-set of the original
                newARR = Array.new( numARR[idx[:low]..idx[:high]] )
                # - Update our counter.
                emergency_break -= 1
            end
        end
        return idx[:ret]
    end
    # ------------------------------
    
    
    # - 4th attempt
    def self.chop_sorted_by_iteration_loop(i, numARR, log = false)
        puts "[chop_sorted_by_iteration_loop]>  i: #{i};  numARR: #{numARR}" if log
        raise unless i.is_a?(Integer) && numARR.is_a?(Array)
        # - Set values to process.
        thisARR = Array.new(numARR)
        idx = { :ret => -1, :track => 0 }
        # - Loop no more times than the number of elements in the array.
        0.upto(numARR.length) do |c|
            if thisARR.length <= 1
                # --- FINAL STATE ---
                idx[:ret] = idx[:track] if thisARR.first && thisARR.first.eql?(i)
                break
            else
                # - update values
                idx[:mid] = thisARR.length/2 - 1
                loARR = thisARR[0..(idx[:mid])]
                if loARR.last && i <= loARR.last
                    thisARR = Array.new(loARR)
                else
                    idx[:track] += (idx[:mid] + 1)
                    thisARR = Array.new( thisARR[(idx[:mid] + 1)..(thisARR.length - 1)] )
                end
                puts "#{thisARR} / #{idx}"
            end
        end
        # - Return
        return idx[:ret]
    end
    # ------------------------------
    
    
    # - 5th attempt
    def self.chop_unsorted_by_recursion2(i, numARR, log = false)
        puts "[chop_unsorted_by_recursion2]>  i: #{i};  numARR: #{numARR}" if log
        raise unless i.is_a?(Integer) && numARR.is_a?(Array)
        # - Determine mid-point for numARR indexes.
        midpt = (numARR.length/2) - 1
        #midpt = numARR.length/2 if numARR.length.odd?
        # --- FINAL STATES ---
        if numARR.length <= 1
            return 0 if numARR.first && numARR.first.eql?(i) # - Found i at the index of 0.
            return -1
        end
        # --- RECURSE ---
        # - Decide whether to recurse on the lower-half or upper-half, first, based on the current microseconds.
        goLow = Time.now.usec.even?
        if goLow
            recResult = self.chop_unsorted_by_recursion2(i, numARR[0..(midpt)], log)
        else
            recResult = self.chop_unsorted_by_recursion2(i, numARR[(midpt+1)..(numARR.length-1)], log)
            recResult = (midpt + 1) + recResult if recResult >= 0
        end
        # - Now check the other half if we didn't find a result.
        if recResult < 0 && goLow
            recResult = self.chop_unsorted_by_recursion2(i, numARR[(midpt+1)..(numARR.length-1)], log)
            recResult = (midpt + 1) + recResult if recResult >= 0
        elsif recResult < 0
            recResult = self.chop_unsorted_by_recursion2(i, numARR[0..(midpt)], log)
        end
        # - Return the result
        puts "[chop_unsorted_by_recursion2:231]>  i: #{i};  numARR: #{numARR};  recResult: #{recResult}" #if log
        return recResult
    end
    # ------------------------------
    
end