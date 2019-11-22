class ApplicationController < ActionController::API
  def render_404(error_message="Not found")
    render_error_status(404, error_message)
  end

  def render_400(error_message="Bad request")
    render_error_status(400, error_message)
  end

  def render_401(error_message="Unauthorized")
    render_error_status(401, error_message)
  end

  def render_403(error_message="Forbidden")
    render_error_status(403, error_message)
  end

  def render_422(error_message="Invalid request")
    render_error_status(422, error_message)
  end

  def render_500(error_message="Something went wrong")
    render_error_status(500, error_message)
  end

  def render_503(error_message="Service Unavailable")
    render_error_status(503, error_message)
  end

  def render_error_status(status, error_message, status_text=nil)
    status_string = status_text || (status == 400 ? "INVALID" : status)
    code = status_string.to_s.starts_with?("E_") ? status_string : "E_#{status_string}"
    render json: {code: code, error: error_message}, status: status
  end
end
