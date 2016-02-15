# Column Swap #
function columnSwap!(A, i,j)
    # input:   A matrix
    #          i,j the row indexes to be swapped
    n = size(A)[2]
    # checking that i and j are within the permitted range
    (i > n || j > n ) && error("Index out of range in the rowSwap")
    # if the index are not the same
    
    
    if i != j 
        buffer = A[i,:]
        A[i,:] = A[j,:]
        A[j,:] = buffer
    end
end
