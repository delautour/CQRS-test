class Form
  include ActiveModel::Model

  def initialize(params)
    super(params.select do |key, value|
      setter = "#{key}="
      respond_to?(setter)
    end)
  end
end
