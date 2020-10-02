require 'parallel_cucumber/dsl'

ParallelCucumber::DSL.after_batch do |outcome, _batch_id, env|
  puts outcome
  outcome.each do |scenario, result|
    if result[:status] == :failed
      requeue(scenario) unless already_rerun?(scenario)
    end
  end
end


def redis
  @redis ||= Redis.new(url: ENV['REDIS'])
end

def requeue(scenario)
  puts "=#=#=#=#=#=#=#=# Requeue #{scenario} =#=#=#=#=#=#=#=#"
  redis.lpush('rerun', scenario)
  redis.rpush('tests', scenario)
end

def already_rerun?(scenario)
  redis.get('rerun').include?(scenario.to_s)
end