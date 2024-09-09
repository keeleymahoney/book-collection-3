require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in "book[author]", with: 'JK Rowling'
        fill_in "book[price]", with: '4'
        select '2019', from: 'book_date_1i'
        select 'January', from: 'book_date_2i' 
        select '2', from: 'book_date_3i' 
        click_on 'Create Book'

        expect(page).to have_content('The book was successfully created!')
    end

    scenario 'invalid title' do
        visit new_book_path
        fill_in "book[title]", with: ''
        click_on 'Create Book'
        expect(page).to have_content("Title can't be blank")
    end

    scenario 'invalid author' do
        visit new_book_path
        fill_in "book[author]", with: ''
        click_on 'Create Book'
        expect(page).to have_content("Author can't be blank")
    end

    scenario 'invalid price' do
        visit new_book_path
        fill_in "book[price]", with: ''
        click_on 'Create Book'
        expect(page).to have_content("Price can't be blank")
    end

    scenario 'invalid date' do
        visit new_book_path
        click_on 'Create Book'
        expect(page).to have_content("Date can't be blank")
    end

    
end