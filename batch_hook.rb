require 'parallel_cucumber/dsl'

ParallelCucumber::DSL.after_batch do |outcome, _batch_id, env|
puts "**************"
  puts outcome
  puts "**************"
end