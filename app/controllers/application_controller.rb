class ApplicationController < ActionController::API
    include JSONAPI::Errors
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    private

    def not_destroyed(e)
        render jsonapi_errors: { errors:  e }, status: :unprocessable_entity
    end
end
