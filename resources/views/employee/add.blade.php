@extends('../master')
@section('title')
Laravel - PL
@endsection
@section('add')
<section class="content-wrap">
	<div class="row">
		<div class="col-md-10 col-md-offset-1" style="margin-left: 60px;">
			<div class="panel panel-default">
				<div class="panel-heading">Create New Employee</div>
				{{-- {{ $message }} --}}
				<div class="panel-body">
					{!! Html::ul($errors->all()) !!}
                   <?php echo Form::open(array('route' => 'employee')); ?>
					{{-- {!! Form::open(array('url' => 'empl')) !!} --}}
					<div class="input-field">
					{!! Form::label('name', 'Employee name'.' *') !!}
					{!! Form::text('name', null, array('class' => 'validate')) !!}
					</div>
					<div class="input-field">
					{!! Form::label('Skills', 'Employee skill'.' *') !!}
					{!! Form::text('skills', null, array('class' => 'validate')) !!}
					</div>
					<div class="input-field">
					{!! Form::label('address', 'Address'.' *') !!}
					<input type="text" class="validate" name="address">
					</div>
					{!! Form::submit('Submit', array('class' => 'waves-effect waves-light btn btn-primary')) !!}
					{!! Form::close() !!}
				</div>
			</div>
		</div>
	</div>
</section>
@endsection
<br />
@section("views")
<table class="table table-responsive" style="text-align:center; margin-left: 60px;">
	<thead>
		<tr>
			<th>Name</th>
			<th>Skills</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		@foreach($employees as  $value)
		<tr>
			<td><?= $value->name ?></td>
			<td><?= $value->skills ?></td>
			<td><?= $value->address ?></td>
			<td>
				<a href="{{ route('view', ['id'=>$value->id] )}}">View</a> / 
				<a href="{{ route('edit', ['id'=>$value->id] )}}">Edit</a> / 
				<a href="{{ route('delete', ['id'=>$value->id] )}}">Delete</a>
			</td>
		</tr>

		@endforeach
	</tbody>
</table>

@endsection