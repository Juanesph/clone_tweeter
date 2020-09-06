ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :image_url
  #
  # or
  #
  permit_params do
    permitted = [:email, :password, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :image_url, :banned]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  # form title: 'Edit User' do |f|
  #   inputs 'Detalles' do
  #     f.input :email
  #     f.input :username
  #     f.input :image_url
  #     f.input :password
  #     f.input :banned
  #   end
  #   actions
  # end

  index do
    id_column
    column :username
    # column :image_url
    # column :followings do |user|
    #   user.followings.count
    # end
    column :tweets do |user|
      user.tweets.count
    end
    column :retweets do |user|
      user.retweets.count
    end
    column :likes do |user|
      user.likes.count
    end
    column :followings do |user|
      user.followings.count
    end
    column :followers do |user|
      user.followers.count
    end
    actions
  end
  
  index as: :grid do |product|
    link_to image_tag(product.image_path), admin_product_path(product)
  end
end
