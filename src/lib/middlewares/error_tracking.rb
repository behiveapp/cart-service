# Middleware about error tracking
class ErrorTracking
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue StandardError => e
    code = e.code.blank? ? 500 : e.code
    Rack::Response.new([{ msg: e.msg, body: e.body }], code, {}).finish
  end
end
