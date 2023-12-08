from datetime import datetime, timedelta
from faker import Faker

#### Gerando data de aniversário  ####
class DateOfBirth:
    def __init__(self):
        self.fake = Faker()        

    def date_of_birth(self, tzinfo=None, minimum_age=18, maximum_age=115):        
        current_date = datetime.now()        
        minimum_date = current_date - timedelta(days=365 * maximum_age)
        maximum_date = current_date - timedelta(days=365 * minimum_age)
       
        random_datetime = self.fake.date_time_between_dates(minimum_date, maximum_date, tzinfo)
        random_date = random_datetime.date()
        return random_date
