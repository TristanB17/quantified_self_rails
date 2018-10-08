class ApiBaseController < ActionController::API
  def safe_search(status_code)
    begin
      yield
    rescue => error
      render json: {error: error.message}, status: status_code
    end
  end
end
