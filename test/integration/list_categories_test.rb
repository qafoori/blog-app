require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: 'sports')
    @category2 = Category.create(name: 'travel')
  end

  test 'should show categories listing' do
    get '/categories'
    assert_select 'a[href=?]', category_path(@category), text: 'Visit'
    assert_select 'a[href=?]', category_path(@category2), text: 'Visit'
  end

end
