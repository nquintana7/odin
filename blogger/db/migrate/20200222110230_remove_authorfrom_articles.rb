class RemoveAuthorfromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_reference :articles, :author, foreign_key: true
    add_reference :articles, :author, foreign_key: {on_delete: :cascade}
  end
end
