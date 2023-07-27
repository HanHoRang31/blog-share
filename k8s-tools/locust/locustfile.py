from locust import HttpUser, task, between
import random

class UserBehavior(HttpUser):
    wait_time = between(1, 2.5)

    @task(1)
    def get_home_page(self):
        self.client.get("http://result.hanhorang.link/")

    @task(2)
    def post_vote(self):
        vote = ['a', 'b'] # a represents 'Cats', b represents 'Dogs'
        self.client.post("http://vote.hanhorang.link/",
                         data={'vote': random.choice(vote)})
