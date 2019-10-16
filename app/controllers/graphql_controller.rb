class GraphqlController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  # before_action :authenticate_u ser!  #only: [:current_user]
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
      current_user: current_user,
      current_staff: current_staff,
      session: session
    }

    # byebug
    result = DistroSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    
    #  const authData = {
    #   accessToken: headers.get("access-token"),
    #   client: headers.get("client"),
    #   expiry: headers.get("expiry"),
    #   tokenType: headers.get("token-type"),
    #   uid: headers.get("uid")
    # };

    # result.to_h['data']['signIn']['user']['authenticationToken']

    # response.set_header('access-token', result.to_h['data']['signIn']['user']['authenticationToken'])
    # response.set_header('token-type','Bearer')
    # response.set_header('uid', result.to_h['data']['signIn']['user']['email'])
    

    # byebug
    render json: result 
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private
  # def current_user
  #   # authenticate_api_v1_user
  #   # byebug
  #   return nil if request.headers['Authorization'].blank?
  #   token = request.headers['Authorization'].split(' ').last
  #   return nil if token.blank?
  #   # AuthToken.verify(token)
  #   user = User.find_by(authentication_token: token)
  #   if user.present?
  #     return user
  #   else
  #     return nil
  #   end
  # end

  def current_staff
    return nil if request.headers['Authorization'].blank?
    token = request.headers['Authorization'].split(' ').last
    return nil if token.blank?
    # AuthToken.verify(token)
    staff = Staff.find_by(authentication_token: token)
    if staff.present?
      return staff
    else
      return nil
    end
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
