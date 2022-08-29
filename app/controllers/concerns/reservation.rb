module Reservation
  def max(a, b)
    a>b ? a : b
  end
  
  def asile(mat, r1, c1, no, m, const)
    l = 0
    while l < r1
      k = 0
      i = 0
      while i < m.length
        if i == 0
          tc = m[i][0]
          if tc != 1
            if l < m[i][1] and no <= const
              mat[l][k+tc-1] = no
              no += 1
            end
            k += tc
          end
          i += 1
          next
        end

        if i == m.length - 1
          tc = m[i][0]
          if tc != 1
            if l< m[i][1] and no <= const
              mat[l][k] = no
              no += 1
            end
          end
          i += 1
          next
        end

        if  l < m[i][1] and no <= const
          mat[l][k] = no
          no += 1
        end
        k += m[i][0]-1
            
        if m[i][0] != 1
          if  l < m[i][1] and no <= const
            mat[l][k] = no
            no += 1
          end
          k += 1
        else
          k += 1
        end
        i += 1
      end
      l += 1
    end
    return no
  end

  def window(mat, r1, c1, no, m, const)
    i = 0
    while i < r1
      if i < m[0][1] and no <= const
        mat[i][0] = no
        no += 1
      end

      if i < m[-1][1] and no <= const
        mat[i][c1 - 1] = no
        no += 1
      end
      i += 1
    end
    return no 
  end
    
  def middle(mat, r1, c1, no, m, const)
    l = 0
    while l < r1
      k = 0
      i = 0
      while i < m.length
        k += 1
        if m[i][0] == 1
          i += 1
          next
        end

        h = 0
        while h < m[i][0] - 2
          if l < m[i][1] and no <= const
            mat[l][k] = no
            no += 1
          end
          k += 1
          h += 1
        end
        k += 1
        i += 1
      end
      l += 1
    end
    return no
  end

  def make(mat, adj, r1, r2, r, c)
    i = 0
    k = 0  
    while k < r
      i = 0
      j = r1
      while i < c
        if mat[k][j] != 0
          adj[k][i] = mat[k][j]
        end
        
        j += 1
        i += 1
      end
      k += 1
    end

    return adj
  end
end