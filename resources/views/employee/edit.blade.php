@extends('../master')
@section('title')
Laravel - PL
@endsection
@section('edit')
<table class="table table-responsive" style="text-align:center">
	<thead>
		<tr>
			<th></th>
			<th>Name</th>
			<th>Skills</th>
			<th>Address</th>
		
		</tr>
	</thead>
	<tbody>
	   @foreach($employee as $user)
        <?php echo Form::open(array('route' => 'update')); ?>
		<tr>
			 <td><input name="id" id=""  type="hidden" value="{{ $user->id }}"></td>
            <td><input name="name" id=""  type="text" value="{{ $user->name }}"></td>
            <td><input name="skills" id=""  type="text" value="{{ $user->skills }}"></td>
            <td><input name="address" id=""  type="text" value="{{ $user->address }}"></td>
            <td> {!! Form::submit('Update', array('class' => 'waves-effect waves-light btn btn-primary')) !!}</td>         
		
		</tr>
       {!! Form::close() !!}
		@endforeach
	</tbody>
</table>
@endsection
