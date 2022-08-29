class ReservationsController < ApplicationController
  include Reservation

  def reservation
    m = params[:seat_format]
    m = JSON.parse(m)
    persons = params[:persons].to_i
    
    n = m.length
    r = 0
    c = 0
    r1 = 0
    c1 = 0
    i = 0
    while i < n
      c1 += m[i][0]
      r1 = max(r1, m[i][1])
      i += 1
    end
    
    mat = Array.new(r1){Array.new(c1, 0)}
    
    no = asile(mat, r1, c1, 1, m, persons)
    no = window(mat, r1, c1, no, m, persons)
    no = middle(mat, r1, c1, no, m, persons)

    list = []
    k  = 0
    m.each do |arr|
      adj = Array.new(arr[1]){Array.new(arr[0], "-")}
      list.push(make(mat, adj, k, k+arr[0], arr[1], arr[0]))
      k += arr[0]
    end

    render json: { table: list }
  end
end
