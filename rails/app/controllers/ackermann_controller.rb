
def ack(m, n)
  if m == 0
    n + 1
  elsif n == 0
    ack(m-1, 1)
  else
    ack(m-1, ack(m, n-1))
  end
end

class AckermannController < ApplicationController
  def index
    render json: {message: ack(params[:m].to_i,params[:n].to_i)}
  end
end
