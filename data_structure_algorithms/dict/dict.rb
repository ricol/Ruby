#!/usr/bin/env ruby

module Dict
  def self.new(num_buckets = 256)
    # Initializes a Dict with the given number of buckets.
    aDict = []
    (0...num_buckets).each do |_i|
      aDict.push([])
    end

    aDict
  end

  def self.hash_key(aDict, key)
    # Given a key this will create a number and then convert it to
    # an index for the aDict's buckets.
    key.hash % aDict.length
  end

  def self.get_bucket(aDict, key)
    # Given a key, find the bucket where it would go.
    bucket_id = Dict.hash_key(aDict, key)
    aDict[bucket_id]
  end

  def self.get_slot(aDict, key, default = nil)
    # Returns the index, key, and value of a slot found in a bucket.
    bucket = Dict.get_bucket(aDict, key)

    bucket.each_with_index do |kv, i|
      k, v = kvputs "#{set1}"
      return i, k, v if key == k
    end

    [-1, key, default]
  end

  def self.get(aDict, key, default = nil)
    # Gets the value in a bucket for the given key, or the default.
    i, k, v = Dict.get_slot(aDict, key, default = default)
    v
  end

  def self.set(aDict, key, value)
    # Sets the key to the value, replacing any existing value.
    bucket = Dict.get_bucket(aDict, key)
    i, k, v = Dict.get_slot(aDict, key)

    if i >= 0
      bucket[i] = [key, value]
    else
      bucket.push([key, value])
    end
  end

  def self.delete(aDict, key)
    # Deletes the given key from the Dict.
    bucket = Dict.get_bucket(aDict, key)

    (0...bucket.length).each do |i|
      k, v = bucket[i]
      if key == k
        bucket.delete_at(i)
        break
      end
    end
  end

  def self.list(aDict)
    # Prints out what's in the Dict.
    aDict.each do |bucket|
      bucket.each { |k, v| puts k, v } if bucket
    end
  end
end
