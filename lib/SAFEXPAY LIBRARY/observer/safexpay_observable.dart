

import 'package:hospital_app/SAFEXPAY%20LIBRARY/observer/safexpay_observer.dart';

import 'observable.dart';

class SafeXPayObservable implements Observable<SafeXPayObserver>{
  static List<SafeXPayObserver> observerList = <SafeXPayObserver>[];

  @override
  void register(SafeXPayObserver observer) {
    if(!observerList.contains(observer)){
      observerList.add(observer);
    }
  }

  @override
  void unRegister(SafeXPayObserver observer) {
    if(observerList.contains(observer)){
      observerList.remove(observer);
    }
  }

  void notifyOnIndexChanged(int index){
    for(SafeXPayObserver observer in observerList){
      observer.onIndexChanged(index);
    }
  }
}