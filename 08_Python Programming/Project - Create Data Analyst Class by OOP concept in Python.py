from datetime import datetime


class DataAnalyst():

  def __init__(self, name, birthyear, skill, company, salary):
    self.name = name
    self.birthyear = birthyear
    self.skill = skill
    self.company = company
    self.salary = salary

  def introduce_yourself(self):
    age = (datetime.now().year) - (self.birthyear)
    print(f"My name's {self.name} and I'm {age} years old.")

  def add_skill(self, new_skill):
    self.skill.append(new_skill)
    print(f"My new skill is {new_skill}.")
    print(f"Now, You have {len(self.skill)} skills!!")

  def job_mobility(self, new_company, new_salary):
    self.compamy = new_company
    self.salary = new_salary
    print(
        f"Congragulations! You have a new job at {self.company} with a salary of ฿{self.salary} per month."
    )


folk = DataAnalyst("Folk", 2002,
                   ["Spreadsheets", "R", "Python", "SQL", "Looker", "PowerBI"],
                   "Google", 40000)

folk.introduce_yourself()
folk.add_skill("Tableau")
folk.job_mobility("Microsoft", 50000)
