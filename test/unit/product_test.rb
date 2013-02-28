require_relative '../test_helper'

class ProductTest < ActiveSupport::TestCase
	test "product must have title"  do
		product = Product.create(MockProductHashBuilder.build_without(:title))
		assert_equal true, product.errors[:title].any?
	end

	test "product must have description"  do
		product = Product.create(MockProductHashBuilder.build_without(:description))
		assert_equal true, product.errors[:description].any?
	end

	test "product must have image_url"  do
		product = Product.create(MockProductHashBuilder.build_without(:image_url))
		assert_equal true, product.errors[:image_url].any?
	end

	test "product price must be more than 0.00" do
		product = Product.create(MockProductHashBuilder.build_with(:price => 0.00))
		assert_equal true, product.errors[:price].any?
	end

	test "product image_url accepts png images" do
		product = Product.create(MockProductHashBuilder.build_with(:image_url => 'image.png'))
		assert_equal false, product.errors[:image_url].any?
	end

	test "product image_url accepts jpg images" do
		product = Product.create(MockProductHashBuilder.build_with(:image_url => 'image.jpg'))
		assert_equal false, product.errors[:image_url].any?
	end

	test "product image_url accepts gif images" do
		product = Product.create(MockProductHashBuilder.build_with(:image_url => 'image.jpg'))
		assert_equal false, product.errors[:image_url].any?
	end

	test "product image_url accepts rejects non-correct image format" do
		product = Product.create(MockProductHashBuilder.build_with(:image_url => 'imagepg'))
		assert_equal true, product.errors[:image_url].any?
	end
end

class MockProductHashBuilder
	
	def self.build_without(key)
		product = { title: "Hello", description: "world", image_url: "image.png", price: 0.01}
		product[key] = nil
		return product
	end

	def self.build_with(hash)
		product = { title: "Hello", description: "world", image_url: "image.png", price: 0.01}
		hash.each do |key,value|
			product[key] = value
		end
		return product
	end
end

