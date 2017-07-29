Spree::Api::V1::UsersController.class_eval do
  before_action :handle_social, only: :create
  

  def create
    authorize! :create, Spree.user_class
    @user = Spree.user_class.new(user_params)
    @user.apply_omniauth(params[:omniauth]) if params[:omniauth].present?

    if @user.save 
      @user.generate_spree_api_key!
      respond_with(@user, status: 201, default_template: :show)
    else
      puts '###################### Custom log ##############################'
      puts @user.errors.to_json
      puts '###################### Custom log End ##############################'


      invalid_resource!(@user)
    end
  end

  def handle_social
      if params[:omniauth].present? && @user = Spree.user_class.find_for_database_authentication(login: params[:omniauth][:email])
        render json: {user:{
            id:    @user.id,
            email: @user.email,
            token: @user.spree_api_key
          }}
      end
  end
end
