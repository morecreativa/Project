// 배민의 짭 Nation Of Delivery
// 배민 짭의 시작이다.
// MS-SQL, Oracle DB 연결
// 
#include <iostream>
#include <vector>
#include <string>

// 일단 메뉴에는 피자 밖에 안팜
// 치즈피자 파인애플피자 미트볼피자

class Nation_Of_Delivery {
public : 
	virtual void set_order_list(std::vector<std::string> order_list) = 0;
	virtual int get_total_price() = 0;
};

class Food {
public :
	std::string name;
	int price;
	Food(std::string name, int price) {
		this->name = name;
		this->price = price;
	}
};

// Just Store List
class PizzaStore : public Nation_Of_Delivery {
private:
	std::vector<Food> menu_list;
	std::vector<std::string>order_list;

public:
	PizzaStore() {
		//initialize menu list
		menu_list= { {"Cheese", 11100}, {"Potato", 12600}, 
		{"Shrimp", 13300},{"Pineapple", 21000}, {"Meatball", 19500} };

		// initialize order_list
		order_list.clear();
	}

	virtual void set_order_list(std::vector<std::string>order_list) {
		for (int i = 0; i < order_list.size(); i++) this->order_list.push_back(order_list[i]);
	};

	virtual int get_total_price() {
		int sum = 0;
		for(int i=0;i<order_list.size();i++)
			for(int j=0;j<menu_list.size();j++)
				if (menu_list[j].name == order_list[i]) {
					sum += menu_list[j].price;
					break;
				}
		return sum;
	};
};

int solution(std::vector < std::string> order_list) {
	Nation_Of_Delivery *delievery_store = new PizzaStore();

	delievery_store->set_order_list(order_list);
	return delievery_store->get_total_price();
}

int main() {
	std::vector<std::string> order = { "Cheese","Pineapple","MeatBall" };
	int ret = solution(order);
	std::cout << "Total Price is " << ret << std::endl;
}