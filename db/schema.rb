# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 2) do

  create_table "comments", :force => true do |t|
    t.column "continent", :text
    t.column "media",     :text
    t.column "country",   :text
    t.column "decade",    :integer
    t.column "genre",     :text
    t.column "market",    :text
  end

end
