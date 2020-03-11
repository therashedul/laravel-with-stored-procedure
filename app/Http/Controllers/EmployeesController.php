<?php
namespace App\Http\Controllers;

use App\Employees;
use Illuminate\Http\Request;
use App\Http\Requests;
use \Auth, \Redirect, \Validator, \Session, \Hash;
use DB;
use App\Post;
class EmployeesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {        
         $employees = DB::select('call view_all_data()');
         return view('employee.add')->with('employees', $employees);     
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        // return  $request->all();
        //  $name = $request->input('name');
        //  $skills = $request->input('skills');
        //  $address = $request->input('address');
        $name=$request->name;
        $skills=$request->skills;
        $address=$request->address;
        $program = DB::select('call add_data(?,?,?)',array($name,$skills,$address));
         return redirect('/')->with('message','Add success');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Employees  $employees
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
     $employee = DB::select("call view_data('$id')");    
     return view('employee.view',['employee'=>$employee]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Employees  $employees
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
     $employee = DB::select("call edit_data('$id')");
     return view('employee.edit',['employee'=>$employee]);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Employees  $employees
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Employees $employees)
    {
        $id=$request->id;
         $name=$request->name;
        $skills=$request->skills;
        $address=$request->address;
        $program = DB::select('call update_data(?,?,?,?)',array($id,$name,$skills,$address));
        return Redirect('/')->with('message','Update success');
    }
    /**
     * Remove the specified resource from storage.
     * @param  \App\Employees  $employees
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {   
        $employee = DB::select("call delete_data('$id')");
        return Redirect('/')->with('message','Delete success');        
    }
}
