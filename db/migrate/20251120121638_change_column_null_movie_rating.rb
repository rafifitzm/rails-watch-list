class ChangeColumnNullMovieRating < ActiveRecord::Migration[7.1]
  def change
    change_column_null :movies, :rating, true
  end
end
