# 定义返回的格式
module Response
  # 定义json格式的返回
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
