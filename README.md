## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->
Create a Rails API for a tea subscription service.


### Built With

» [Ruby on Rails](https://rubyonrails.org/)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

» Ruby version 2.7.2<br />
» Rails version 5.2.6

### Installation

1. Clone the repo
   ```rb
   git clone https://github.com/Aferencz1987/spilling_tea.git
   ```
2. Install gems
   ```rb
   bundle install
   ```
3. Run
   ```rb
   rails db:{create,migrate}
   ```


## Contributing

Contributions are what make the open source community such an amazingly, amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/RadFeature`)
3. Commit your Changes (`git commit -m 'Add some RadFeature'`)
4. Push to the Branch (`git push origin feature/RadFeature`)
5. Open a Pull Request


## Contact

Leigh Cepriano Pulzone - [Linkedin](https://www.linkedin.com/in/alex-ferencz) - [GitHub](https://github.com/Aferencz1987) - alex.ferencz6@gmail.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)



## Acknowledgements

» [README Template Source](https://github.com/othneildrew/Best-README-Template)<br />
» [Turing Requirements](https://mod4.turing.edu/projects/take_home/take_home_be)

##Information required in JSON

*To get all subscriptions
get '/customer/:id/subscriptions', to: 'subscriptions#index'


*To create a subscription
```
post "/api/v1/customer/:id/subscription"
```
required information from FE:
Tea name
dollar amount float
frequency in days
```
{
  title: "name",
  price: float,
  frequency: integer,
}, as: :json
```
Return values for
create subscription
```
{:body=>
  {:data=>
    {:id=>"117",
     :type=>"subscription",
     :attributes=>
      {:title=>"black tea", :price=>5.0, :status=>"active", :frequency=>30, :customer_id=>149, :tea_id=>189}}},
 :status=>201}
```
*To change frequency
```
patch '/subscription/:id', to: 'subscriptions#update'
```
Required information from FE:
```
{
  frequency: 40
}, as: :json
```
Return values for update frequency
```
{:body=>
  {:data=>
    {:id=>"115",
     :type=>"subscription",
     :attributes=>
      {:title=>"black tea", :price=>5.0, :status=>"active", :frequency=>40, :customer_id=>147, :tea_id=>187}}},
 :status=>200}
```
 *To deactivate a subscription
 ```
delete '/subscription/:id', to: 'subscriptions#delete'
```
Required information from FE:

Return values for deactivation
```
{:body=>
  {:data=>
    {:id=>"119",
     :type=>"subscription",
     :attributes=>
      {:title=>"black tea", :price=>5.0, :status=>"inactive", :frequency=>30, :customer_id=>152, :tea_id=>192}}},
 :status=>200}
 ```
