FactoryGirl.define do
  factory :guest do
    first_name do
      names = %w(John Bill Andy Frank Michael Tony Justin Bob JD) +
              %w(Anna Ellie Joanetta Alyssa Lisa Brittney Allison Liz)
      names.sample
    end

    last_name do
      %w(Smith Wolk Paniagua Anderson Jackson Wise Cole Jones Brooks).sample
    end

    sequence(:email) { |n| "guest#{n}@example.com" }
  end
end
