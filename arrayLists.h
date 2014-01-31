#ifndef ARRAYLISTS_H_INCLUDED
#define ARRAYLISTS_H_INCLUDED
#include <iostream>
#include <assert.h>
#include <algorithm>
using namespace std;
template <class T>
class Array {
    protected:
        T *a;
        int length;
    public:
// The size of an array is specified at the time of creation:
        Array(int len) {
            length = len;
            a = new T[length];
            }
// the elements of an array can be indexed:
        T& operator[](int i) {
            assert(i >= 0 && i < length);
            return a[i];
            }
        Array& operator=(Array<T> &b) {
            if (a != NULL) delete[] a;
            a = b.a;
            b.a = NULL;
            length = b.length;
            return *this;
            }
        int len() {
            return length;
            }
    };
template <class T>
class List {
    protected:
        Array<T>* eles;
        int nUsed;
    public:
        List<T> (int size) {
            eles = new Array<T>(size);
            nUsed=0;
            }
        //Indexing:   or Get(index), Set (index, item)
        List& operator=(List<T> &b) {
            //if (b.eles!= NULL) delete[] b.eles.a;
            eles =  b.eles;
            //b.eles = NULL;
            (*eles).length = (*b.eles).length;
            return *this;
            }
        T& operator[](int i) {
            assert(i >= 0 && i < nUsed);
            return (*eles)[i];
            }
        void addItem(T item) {
            if (nUsed<(*eles).len()) {
                (*eles)[nUsed] = item;
                nUsed++;
                }
            }
//Remove(item) {}
        T remove(int index) {
            T x = (*eles)[index];
            for (int i= index; i<nUsed-1; i++) {
                (*eles)[i]=(*eles)[i+1];
                }
            nUsed--;
            return x;
            }
//Replace(oldItem, newItem)
//Replace (index, newItem)
    public:
        int len() {
            return nUsed;
            }
        void printList() {
            for (int i=0; i<nUsed; i++) {
                cout << (*eles)[i] << ", ";
                }
            }
    };
template <class T>
class Stack : public List<T> {
    public:
        Stack<T> (int size) : List<T>(size) {
            }
        void add(T item) {
            List<T>::addItem(item);
            }
        T remove() {
            return List<T>::remove(List<T>::nUsed-1);
            }
        bool empty() {
            return (List<T>::len() <=0);
            }
        T front() {
            return List<T>::operator[](List<T>::nUsed-1);
            }
    };
template <class T>
class Queue : public List<T> {
    protected:
    public:
        Queue<T>(int size) : List<T>(size) {
            }
        void add(T item) { 
            List<T>::addItem(item);
        }
        T remove() {
            return List<T>::remove(0);
        }
        T front() {
            assert(!empty());
            return List<T>::operator[](0);
        }
        bool empty() {
          return (List<T>::len() <=0); 
        }
    };
#endif // ARRAYLISTS_H_INCLUDED
