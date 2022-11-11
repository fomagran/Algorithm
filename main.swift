class Twitter {
    struct Tweet {
        let tweetId: Int
        let timestamp: Int
    }
    
    private var allTweets = [Int: [Tweet]]()
    private var followers = [Int: [Int:Bool]]()
    private var total = 0

    init() {
        
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        total += 1
        allTweets[userId,default: []].append(Tweet(tweetId: tweetId, timestamp: total))
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        var tweets = allTweets[userId,default: []]
        let userFollowers = followers[userId,default: [:]].keys
    
        for followerId in userFollowers {
            tweets.append(contentsOf: allTweets[followerId,default: []])
        }
        
        let sorted = tweets.sorted { $0.timestamp > $1.timestamp }.map { $0.tweetId }

     
        return sorted.count > 10 ? Array(sorted[0...9]) : sorted
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId,default: [:]][followeeId] = true
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId,default: [:]][followeeId] = nil
    }
}

let twitter = Twitter();
twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
print(twitter.getNewsFeed(1))  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
twitter.follow(1, 2);    // User 1 follows user 2.
twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
print(twitter.getNewsFeed(1))  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
twitter.unfollow(1, 2);  // User 1 unfollows user 2.
print(twitter.getNewsFeed(1))
