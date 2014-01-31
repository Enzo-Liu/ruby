#include <iostream>
#include "ArrayLists.h"
//#include "stackQueue.h"
using namespace std;
int main() {
    Array<int> integers(10);
    cout << "   TEST ARRAYS" << endl;
    cout << " integer Array [" << integers.len() << "]:";
    for (int i=0; i<integers.len(); i++) {
        integers[i]= i;
        cout << integers[i] << ", ";
        }
    cout << endl;
    Array<string> strings(4);
    strings[0]="this";
    strings[1]="is";
    strings[2]="a";
    strings[3]="test";
    cout << " string Array [" << strings.len() << "]:";
    for (int i=0; i<strings.len(); i++) {
        cout << strings[i] << " ";
        }
    cout << endl;
    cout << endl << "    TEST LISTS" << endl;
    List<string> stringList(5);
    stringList.addItem("this");
    stringList.addItem("is");
    stringList.addItem("a");
    stringList.addItem("list");
    stringList.addItem("test");
    cout << "stringList("<<stringList.len()<<"):";
    stringList.printList();
    cout << endl;
    List<string> SL2 = stringList;
    cout << "SL2("<<SL2.len()<<"):";
    SL2.printList();
    cout << endl;
    cout << endl << "  TEST STACK" << endl;
    Stack<string> strStack(10);
    // add strings in list order
    for (int i=0; i<strings.len(); i++) {
        strStack.add(strings[i]);
        }
    cout << "strStack [" << strStack.len() << "] in array order:";
    strStack.printList();
    cout << endl;
    cout << "top of stack is " << strStack.front()  << endl;
    // print in pop order
    cout << " popping strStack(" << strStack.len() << "):";
    while (!strStack.empty()) {
        cout << strStack.remove() << ", ";
        }
    cout << endl;

    // below here will not work until you finish the definition of Queue !!!
    cout << endl << "  TEST QUEUE" << endl;
    Queue<int> intQue(10);
    for (int i = 0; i<integers.len(); i++){
       intQue.add(integers[i]);
    }
    cout << "front of queue is " << intQue.front()  << endl;
    cout << "queue [" << intQue.len() << "] in array order:";
    intQue.printList();
    cout << endl;
    cout << " removing from intQue(" << intQue.len() << "):";
    while (!intQue.empty()) {
        cout << intQue.remove() << ", ";
        }
    cout << endl;
    return 0;
    }